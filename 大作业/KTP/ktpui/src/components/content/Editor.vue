<template>
  <div>
    <div ref="toolbar" class="toolbar"></div>
  </div>
</template>

<script>
  import E from 'wangeditor'
  export default {
    name: 'editor',
    props: {
      description: {
        type:String,
        default: '',
      }
    },
    data () {
      return {
        editorContent: this.description
      }
    },
    mounted() {
      const editor = new E(this.$refs.toolbar)
      editor.create()

    }
  }
</script>

<style scoped>
  .toolbar {
    border: 1px solid #ccc;
  }
  .text {
    border: 1px solid #ccc;
    height: 400px;
  }
</style>
