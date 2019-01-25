<template>
  <div>
    <div>
      <ul class="collection">
        <li class="collection-item" v-for="post in posts" :key="'row_post_' + post.id" v-bind:id="'row_post_' + post.id">
          <label v-bind:for="'post_' + post.id">
            <p>{{ post.text }}</p>
          </label>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        posts: [],
      }
    },
    mounted: function () {
      this.fetchPosts();
    },
    methods: {
      fetchPosts: function () {
        axios.get('/api/v1/posts?format=json').then((response) => {
          for(var i = 0; i < response.data.posts.length; i++) {
            this.posts.push(response.data.posts[i]);
          }
        }, (error) => {
          console.log(error);
        });
      },
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
</style>
