# vue-c

A simple gem (not hosted on https://rubygems.org) for generating [Vue.js](https://vuejs.org/v2/guide/components.html) components.

## Installation
- download the source file
- build the gem with `gem build vue-c.gemspec`
- install the gem from local: `gem install vue-c-0.0.1.gem` (use the correct version number here)

## Configuration

You can configure generation of the component by creating `.vue-c` file in the root of the project (the folder in which you are calling the `vue-c` command).

You can set the `lang` attribute of the generated `style` tag by setting json:

```json
// will generate <style scoped lang="scss"> in the component
{
  "style[lang]":"scss"
}
```

```json
// will generate automatically add 'mag' prefix to generated controller name ('mag-button')
// and file name ('MagButton') when called 'vue-c button'
{
  "auto-prefix":"mag"
}
```

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

<style scoped lang="scss">

</style>

```
