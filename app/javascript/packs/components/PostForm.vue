<template>
     <div class="row margin-default">
      <div class="col s10 m11">
        <input v-model="newPost" id="new-post-form" class="form-control padding-default" placeholder="ぐちを言おう！">
      </div>
      <div class="col s2 m1">
        <button class="btn-floating waves-effect waves-light red" v-on:click="createPost">
          <i class="material-icons">add</i>
        </button>
      </div>
    </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        newPost: ''
      }
    },
    methods: {
      createPost: function () {
        if (!this.newPost) return;
        axios.post('/api/v1/posts', { posts: { text: this.newPost } }).then((response) => {
          this.posts.unshift(response.data.post);
          this.newPost = '';
        }, (error) => {
          console.log(error);
        });
      }
    }
  }
</script>

<style scoped>
  [v-cloak] {
    display: none;
  }
  .margin-default {
    margin-top: 30px;
  }
  .padding-default {
    padding-left: 20px;
  }
  .word-color-black {
    color: #000000;
  }
  .collection-item:hover {
    background-color: #ddd;
  }
  .display_none {
    display:none;
  }
  .line-through {
    text-decoration: line-through;
  }
  .btn-custom {
    text-transform: none;
    padding: 0 10px;
    font-size: 0.8rem;
    background-color: white;
    color: black;
    border-color: black;
  }
</style>
