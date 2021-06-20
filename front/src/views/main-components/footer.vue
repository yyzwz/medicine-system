<template>
  <div class="foot">
    <!-- <Row type="flex" justify="space-around" class="help">
      <a class="item" href="https://blog.csdn.net/qq_41464123" target="_blank">CSDN</a>
      <a class="item" href="https://gitee.com/yyzwz" target="_blank">码云</a>
      <a class="item" href="https://space.bilibili.com/417412814" target="_blank">B站</a>
    </Row> -->
    <Row type="flex" justify="center" class="copyright">
      绍兴文理学院元培学院 网络1701
      <a
        href="https://blog.csdn.net/qq_41464123"
        target="_blank"
        style="margin:0 5px;"
      >唐倩</a>
    </Row>
  </div>
</template>

<script>
export default {
  name: "footer"
};
</script>

<style lang="less">
.foot {
  width: 100%;
  margin-top: 5vh;
  margin-bottom: 3vh;
  color: rgba(0, 0, 0, 0.45);
  font-size: 18px;
  .help {
    margin: 0 auto;
    margin-bottom: 1vh;
    width: 60%;
    .item {
      color: rgba(0, 0, 0, 0.45);
    }
    :hover {
      color: rgba(0, 0, 0, 0.65);
    }
  }
}
</style>
