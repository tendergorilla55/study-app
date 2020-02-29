<template>
  <div>
    <h2>{{ headingText }}</h2>
    <a
      :href="href"
    >TOPに戻る</a>
  </div>
</template>

<script>
  export default {
    props: {
      headingText: {
        type: String,
        default: '',
      },
      href: {
        type: String,
        default: '/',
        require: true,
      }
    },
  };
</script>

<style scoped>

</style>
