## MyBatis

- mybatis配置文件

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
			PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
			"http://mybatis.org/dtd/mybatis-3-config.dtd">

<configuration>
	<environments default="development">
    	<environment id="development">
        	<transactionManager type="JDBC" />
            <dataSource type="POOLED">
            	<property name="driver" value="com.mysql.jdbc.Driver" />
                <property name="url" value="jdbc:mysql://localhost:3306/mybatis?useSSL=true&amp;useUnicode=true&amp;characterEncoding=UTF-8" />
                <property name="username" value="root" />
                <property name="password" value="123456" />
            </dataSource>
        </environment>
    </environments>
    
    <!-- 每一个Mapper.xml都需要在Mybatis核心配置文件中注册 -->
    <mappers>
    	<mapper resource="com/oyjr/mapper/UserMapper.xml" />
    </mappers>
</configuration>
```

- Maven中防止资源到处失败

```xml
<build>
	<resources>
    	<resource>
        	<directory>src/main/resources</directory>
            <includes>
            	<include>**/*.properties</include>
                <include>**/*.xml</include>
            </includes>
            <filtering>true</filtering>
        </resource>
        <resource>
        	<directory>src/main/java</directory>
            <includes>
            	<include>**/*.properties</include>
                <include>**/*.xml</include>
                <filtering>true</filtering>
            </includes>
        </resource>
    </resources>
</build>
```

- mapper.xml写法

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
			PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
			"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.oyjr.mapper.UserMapper">
	<!-- 业务逻辑语句 -->
</mapper>
```

### CRUD

#### 1、namespace

namespace中的包名要和Mapper/Dao接口的包名保持一致

#### 2、select

```xml
<select id="getUser" resultType="com.oyjr.pojo.User">
	select * from mybatis.user
</select>
<select id="getUserById" resultType="com.oyjr.pojo.User" parameterType="int">
	select * from mybatis.user where id=#{id}
</select>
```

选择/查询语句

- id: 对应的就是namespace中的Mapper/Dao接口中的方法名

- resultType: Sql语句的返回值

- parameterType: 参数类型(int, String, ...)

- #{}: 通过该符号取变量值

#### 3、insert

```xml
<insert id="addUser" parameterType="com.oyjr.pojo.User">
	insert into mybatis.user (id, name, password) values (#{id},#{name},#{password});
</insert>
```

- 对象值可以直接取出
- 增删改必须提交事务(sqlSession.commit)

#### 4、update

```xml
<update id="updateUser" parameterType="com.oyjr.pojo.User">
	update mybatis.user set name=#{name},password=#{password} where id=#{id}
</update>
```

#### 5、delete

```xml
<delete id="updateUser" parameterType="int">
	delete from mybatis.user where id=#{id}
</delete>
```

### 分析错误

- 标签不能匹配错误
- resource绑定mapper，需要使用路径，用**/**隔开

### 类型别名

- 类型别名是Java类型设置的一个短的名字
- 存在的意义仅在于用来减少完全限定名的冗余

```xml
<typeAliases>
	<typeAlias type="com.oyjr.pojo.User" alias="User" />
</typeAliases>
```

也可以指定一个包名，MyBatis会在包名下面搜索需要的Java Bean，比如

扫描实体类的包，它的默认别名就为这个类的类名，推荐首字母小写

```xml
<typeAliases>
	<package name="com.oyjr.pojo" />
</typeAliases>
```

- 在实体类少的时候使用第一种
- 如果实体类十分多，建议使用第二种
- 第一种可以DIY，第二种则不行(注解可以)

### resultMap

结果集映射

用于解决数据库字段与实体类字段不相同问题

```xml
<resultMap id="UserMap" type="User">
	<!-- column:数据库中的字段, property:实体类中的属性 -->
    <result column="id" property="id" />
    <result column="name" property="name" />
    <result column="pwd" property="password" />
</resultMap>

<select id="getUserById" resultMap="UserMap">
	select * from mybatis.user where id=#{id};
</select>
```

### 多对一处理

```java
public interface TeacherMapper {
    Teacher getTeacher(@Param("tid") int id);
}
```

```java
public interface StudentMapper {
    List<Student> getStudent(@Param("id") int id);
}
```

```java
@Data
public class Student {
    private int id;
    private String name;
    private int tid;
}
```

```java
@Data
public class Teacher {
    private int id;
    private String name;
    private List<Student> students;
}
```

- 按照查询嵌套处理

```xml
<select id="getStudent" resultMap="StudentTeacher">
	select * from student;
</select>

<resultMap id="StudentTeacher" type="Student">
	<result property="id" column="id" />
    <result property="name" column="name" />
    <!-- 复杂的属性，我们需要单独处理，对象：association 集合：collection -->
    <association property="teacher" column="tid" javaType="Teacher" select="getTeacher" />
</resultMap>

<select id="getTeacher" resultType="Teacher">
	select * from teacher where id=#{id};
</select>
```

- 按照结果嵌套查询

```xml
<select id="getStudent2" resultMap="StudentTeacher2">
	select s.id sid,s.name sname,t.name tname 
    from student s,teacher t
    where s.tid=t.id;
</select>

<resultMap id="StudentTeacher2" type="Student">
	<result property="id" column="sid" />
    <result property="name" column="sname" />
    <association property="teacher" javaType="Teacher">
    	<result property="name" column="tname" />
    </association>
</resultMap>
```

### 一对多处理

- 按照结果嵌套查询

```xml
<select id="getTeacher" resultMap="TeacherStudent">
	select s.id sid,s.name sname,t.name tname,t.id tid
    from student s,teacher t
    where s.tid = t.id and t.id=#{tid}
</select>

<resultMap id="TeacherStudent" type="Teacher">
	<result property="id" column="tid" />
    <result property="name" column="tname" />
    <!--
 		javaType: 指定属性的类型
 		ofType: 集合中的泛型信息，我们使用ofType获取
	-->
    <collection property="students" ofType="Student">
    	<result property="id" column="sid" />
        <result property="name" column="sname" />
        <result property="tid" column="tid" />
    </collection>
</resultMap>
```

- 按照查询嵌套查询

```xml
<select id="getTeacher" resultMap="StudentTeacher">
	select * from teacher where id=#{tid};
</select>

<resultMap id="StudentTeacher2" type="Teacher">
    <collection property="students" javaType="ArrayList" ofType="Student" select="getStudentByTeacherId" column="id" />
</resultMap>

<select id="getStudentByTeacherId" resultType="Student">
	select * from student where tid=#{tid};
</select>
```

### 动态SQL

#### IF

```xml
<select id="queryBlog" resultType="Blog">
    <!-- 1=1用于防止后面全为null -->
	select * from mybatis.blog where 1=1
    <!-- 这里test中的title表示传入的参数 -->
    <if test="title != null">
    	and title=#{title}
    </if>
    <if test="author != null">
    	and author=#{author}
    </if>
</select>
```

#### where标签

```xml
<select id="queryBlog" resultType="Blog">
	select * from mybatis.blog
    <where>
    	<if test="title != null">
    		and title=#{title}
        </if>
        <if test="author != null">
            and author=#{author}
        </if>
    </where> 
</select>
```

等价于上一条sql语句，<where\>标签比较智能，如果没有条件，则自动去掉where，也会将第一个and去掉，更加的安全。

#### choose, when, otherwise

choose有点像java的switch, when-->case, otherwise-->default

```xml
<select id="queryBlogChoose" resultType="Blog">
	select * from mybatis.blog
    <where>
    	<choose>
        	<when test="title != null">
                and title=#{title}
            </when>
            <when test="author != null">
            	and author=#{author}
            </when>
            <otherwise>
            	and views=#{views}
            </otherwise>
        </choose>
    </where> 
</select>
```

#### set标签

```xml
<update id="updateBlog">
	update mybatis.blog
    <set>
    	...
    </set>
</update>
```

动态设置前置set，去除多余的逗号

#### SQL片段

```xml
<sql id="if-title-author">
	<if test="title != null">
    	title=#{title}
    </if>
    <if test="author != null">
    	and author=#{author}
    </if>
</sql>

<select id="queryBlog" resultType="Blog">
	select * from mybatis.blog
    <where>
    	<include refid="if-title-author"></include>
    </where> 
</select>
```

- 使用sql标签抽取公共部分
- 在需要使用的地方使用include标签引用即可

注意事项：

- 最好基于单表来定义SQL片段
- 不要存在where标签

#### foreach

主要用于对一个集合进行遍历，通常在构建in条件语句的时候使用

```xml
<select id="selectPostIn" resultType="domain.blog.Post">
	SELECT *
    FROM POST P
    WHERE ID IN
    <foreach item="xx" index="index" collection="list" open="(" separator="," close=")">
    	#{xx}
    </foreach>
</select>
```

#### 缓存

定义缓存

```xml
<!-- 只需要在mapper里面定义一个cache标签即开启了缓存 -->
<cache />

<!-- 高级设置详看文档 -->
<cache eviction="FIFO"
       flushInterval="60000"
       size="512"
       readOnly="true" />
<!-- 在配置文件中添加settings可以显示的配置全局缓存，默认自动开启 --> 
```

