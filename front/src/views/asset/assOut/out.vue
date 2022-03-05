<style lang="less">
@import "../../../styles/table-common.less";
</style>
<template>
<Tabs :value="chooseName" @on-click="changeTab" type="card">

    <TabPane label="固定资产" name="name1" icon="logo-windows">
        <main1></main1>
    </TabPane>

    <TabPane label="耗材" name="name2" icon="logo-apple">
        <main2></main2>
    </TabPane>

</Tabs>
</template>

<script>
import main1 from "./main1.vue";
import main2 from "./main2.vue";
export default {
    name: "jichu-manage",
    components: {
        main1,
        main2,
    },
    data() {
        return {
            chooseName: 'name1'
        };
    },
    methods: {
        changeTab(value) {
            this.chooseName = value;
        }
    }
}
</script>
