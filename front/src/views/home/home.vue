<style lang="less" scoped>
@import "./home.less";
@import "../../styles/common.less";

.background1 {
    background-image: url("https://jujia.lucheng.gov.cn/app/file/view/1480461044097880065")
}

.background2 {
    background-image: url("https://jujia.lucheng.gov.cn/app/file/view/1480461029442981889")
}

.background3 {
    background-image: url("https://jujia.lucheng.gov.cn/app/file/view/1480461011805933569")
}
</style>

<template>
<div>
    <div id="myloader">
        <div class="loader">
            <div class="grid">
                <div class="cube cube1"></div>
                <div class="cube cube2"></div>
                <div class="cube cube3"></div>
                <div class="cube cube4"></div>
                <div class="cube cube5"></div>
                <div class="cube cube6"></div>
                <div class="cube cube7"></div>
                <div class="cube cube8"></div>
                <div class="cube cube9"></div>
            </div>
        </div>
    </div>
    <div id="main-wrap">
        <div id="page-content" class="header-static">
            <div id="flexslider-nav" class="fullpage-wrap small">
                <ul class="slides">
                    <li class="background1">
                        <div class="text center">
                            <h1 class="heading center white margin-bottom-small flex-animation">城乡居民大病保险管理系统<br>-</h1>
                            <p class="heading white center margin-bottom flex-animation">郑为中</p>
                            <p class="heading white center margin-bottom flex-animation">本次登录地点:{{city}}</p>
                            <div class="padding-onlytop-md flex-animation">
                                <!-- <a href="https://blog.csdn.net/qq_41464123" target="_Blank" class="btn-alt small shadow margin-xs-bottom-small">CSDN</a>
                                <a href="https://gitee.com/yyzwz" target="_Blank" class="btn-alt small shadow">码云</a> -->
                            </div>
                        </div>
                        <div class="gradient dark"></div>
                    </li>
                    <li class="background2">
                        <div class="text center">
                            <h1 class="heading center white margin-bottom-small flex-animation no-opacity">城乡居民大病保险管理系统<br>-</h1>
                            <p class="heading white center margin-bottom flex-animation no-opacity">郑为中</p>
                            <p class="heading white center margin-bottom flex-animation">本次登录地点:{{city}}</p>
                            <div class="padding-onlytop-md flex-animation no-opacity">
                                <!-- <a href="https://blog.csdn.net/qq_41464123" target="_Blank" class="btn-alt small shadow margin-xs-bottom-small">CSDN</a>
                                <a href="https://gitee.com/yyzwz" target="_Blank" class="btn-alt small shadow margin-xs-bottom-small">码云</a> -->
                            </div>
                        </div>
                        <div class="gradient dark"></div>
                    </li>
                    <li class="background3">
                        <div class="text center">
                            <h1 class="heading center white margin-bottom-small flex-animation no-opacity">城乡居民大病保险管理系统<br>-</h1>
                            <p class="heading white center margin-bottom flex-animation no-opacity">郑为中</p>
                            <p class="heading white center margin-bottom flex-animation">本次登录地点:{{city}}</p>
                            <div class="padding-onlytop-md flex-animation no-opacity">
                                <!-- <a href="https://blog.csdn.net/qq_41464123" target="_Blank" class="btn-alt small shadow margin-xs-bottom-small">CSDN</a>
                                <a href="https://gitee.com/yyzwz" target="_Blank" class="btn-alt small shadow margin-xs-bottom-small">码云</a> -->
                            </div>
                        </div>
                        <div class="gradient dark"></div>
                    </li>
                </ul>
                <div class="slider-navigation">
                    <a href="#" class="flex-prev"><i class="material-icons">←</i></a>
                    <div class="slider-controls-container"></div>
                    <a href="#" class="flex-next"><i class="material-icons">→</i></a>
                </div>
            </div>
            <!--  END Slider  -->
        </div>
        <!--  END Page Content -->
    </div>
    <!--  Main Wrap  -->
</div>
</template>

<script>
import {
    ipInfo
} from "@/api/index";
export default {
    name: "show",
    data() {
        return {
            city: ''
        };
    },
    methods: {},
    watch: {},
    mounted() {
        const s = document.createElement('script');
        s.type = 'text/javascript';
        s.src = 'https://changjienongye.cn/bs/assets/js/jquery.min.js';
        document.body.appendChild(s);
        const s2 = document.createElement('script');
        s2.type = 'text/javascript';
        s2.src = 'https://changjienongye.cn/bs/assets/js/jquery.flexslider-min.js';
        document.body.appendChild(s2);
        const s3 = document.createElement('script');
        s3.type = 'text/javascript';
        s3.src = 'https://changjienongye.cn/bs/assets/js/pace.min.js';
        document.body.appendChild(s3);
        const s4 = document.createElement('script');
        s4.type = 'text/javascript';
        s4.src = 'https://changjienongye.cn/bs/assets/js/main.js';
        document.body.appendChild(s4);
        ipInfo().then(res => {
            if (res.success) {
                this.city = res.result;
            }
        });
    }
};
</script>
