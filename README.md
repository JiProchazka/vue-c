# vue-c

A simple gem (not hosted on https://rubygems.org) for generating [Vue.js](https://vuejs.org/v2/guide/components.html) components.

## Installation
- download the source file
- build the gem with `gem build vue-c.gemspec`
- install the gem from local: `gem install vue-c-0.0.1.gem` (use the correct version number here)

## Using

    $ vue-c components/RedButton

Generates this file:

```javascript
// ./src/components/RedButton.vue
<template>
  <div>

  </div>
</template>

<script>
  export default {
    name: 'red-button',
    props: {
      name: {
        type: String,
        required: true
      }
    }
  }
</script>

<style scoped>

</style>

```
