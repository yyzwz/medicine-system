// table-expand.vue

<template>
    <div>
         <!-- style="width:5000px;" -->

        <!-- <Row class="expand-row" style="width:3800px;margin-left:225px;margin-bottom:5px;">
            <Col span="3">
                <center><span class="expand-key" style="font-size:24px;color:#ff0000;">用户详细信息 </span></center>
            </Col>
            
        </Row> -->


        <Row class="expand-row" style="width:3800px;margin-left:225px;margin-bottom:5px;">
            <Col span="2">
                <span class="expand-key">年份: </span>
                <span class="expand-value">{{ row.year }}</span>
            </Col>
            <Col span="2">
                <span class="expand-key">编号: </span>
                <span class="expand-value">{{ row.sheBeiId }}</span>
            </Col>
        </Row>

        <!-- ----------------------  分隔线  ---------------------- -->

        <Row class="expand-row" style="width:3800px;margin-left:225px;margin-bottom:5px;">
            <Col span="2">
                <span class="expand-key">品名: </span>
                <span class="expand-value">{{ row.name }}</span>
            </Col>
            <Col span="2">
                <span class="expand-key">型号: </span>
                <span class="expand-value">{{ row.typeNum }}</span>
            </Col>
            
        </Row>

        <!-- ----------------------  分隔线  ---------------------- -->

        <Row class="expand-row" style="width:3800px;margin-left:225px;margin-bottom:5px;">
            <Col span="2">
                <span class="expand-key">使用部门: </span>
                <span class="expand-value">{{ row.useDepartment }}</span>
            </Col>
            <Col span="2">
                <span class="expand-key">额定使用期限: </span>
                <span class="expand-value">{{ row.useQiXian }}</span>
            </Col>
        </Row>

        <!-- ----------------------  分隔线  ---------------------- -->

        <Row class="expand-row" style="width:3800px;margin-left:225px;margin-bottom:5px;">
            <Col span="2">
                <span class="expand-key">数量: </span>
                <span class="expand-value">{{ row.num }}</span>
            </Col>
            <Col span="2">
                <span class="expand-key">单价: </span>
                <span class="expand-value">{{ row.oneMoney }}</span>
            </Col>
        </Row>


        <!-- ----------------------  分隔线  ---------------------- -->

        <Row class="expand-row" style="width:3800px;margin-left:225px;margin-bottom:5px;">
            
            <Col span="2">
                <span class="expand-key">创建时间: </span>
                <span class="expand-value">{{ row.createTime }}</span>
            </Col>
        </Row>

        <!-- ----------------------  分隔线  ---------------------- -->

    </div>
</template>
<script>
    export default {
        props: {
            row: Object
        }
    };
</script>