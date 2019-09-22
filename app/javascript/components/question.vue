<template>
  <div>
    <div class="container">
      <form>
        <div class="form-group">
          <label for="form_title">質問名</label>
          <input type="text" name="question[content" class="form-control" id="content">
          <button type="button" class="btn btn-primary" v-on:click="postQuestion">作成する</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        question: {
          content: null,
        },
      }
    },
    methods: {

    }
  }
</script>

<style scoped>

</style>
