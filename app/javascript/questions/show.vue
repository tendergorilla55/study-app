<template>
  <div data-turbolinks="false">
    <router-link :to="{ name: 'questions_path' }">質問箱に戻る</router-link>
    <p>
      {{ question.title }} {{ question.created_at | timeFormat }} {{ question.user.name }}
    </p>
    <p>
      {{ question.content }}
    </p>
    <div>
      <label>回答</label>
      <textarea type="text" v-model="answer.text" id="comment"></textarea>
      <input type="hidden" id="id" name="id" value="9">
      <button type="button" class="btn brn-primary" v-on:click="postAnswer">回答する</button>
    </div>
    <div>
      <p>回答一覧</p>
      <li v-for="answer in answers">
        <div>
          <p>
            {{ answer.created_at | timeFormat }} {{ answer.user.name }}
          </p>
          <p>
            {{ answer.text }}
          </p>
        </div>
      </li>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data: function () {
      return {
        id: this.$route.params.id,
        question: {
          title: "",
          content: "",
          created_at: "",
          user: "",
        },
        answers: [],
        answer: {
          question_id: this.$route.params.id,
          text: "",
        }
      }
    },
    filters: {
      timeFormat: function(time) {
        var date = time.split(/[-T:.]/);
        var fullDate = date[0] + "/" + date[1] + "/" + date[2];
        var fullTime = date[3] + ":" + date[4];
        return fullDate + " " + fullTime
      }
    },
    mounted: function() {
      this.fetchData(this.id);
    },
    methods: {
      fetchData: function(id) {
        axios.get(`/questions/${id}.json`).then( res => {
          this.question = res.data["question"];
          this.answers = res.data["answers"];
        }).catch(res => {
          alert('データ取得できませんでした。');
          window.location.href = '/questions';
        });
      },
      postAnswer: function(id) {
        axios.post(`/questions/${id}/answer`, {
          answer: this.answer,
        }).then(res => {
          this.answer.text ="";
          this.fetchData(res.data.id);
          if (res.data.status == "ng") {
            alert('回答を入力してください')
          }
        })
      }
    }
  }
</script>

<style scoped>

</style>
