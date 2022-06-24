<template>
<div>
    <Card>
        <div slot="title">
            <div class="edit-head">
                <a @click="close" class="back-title">
                    <Icon type="ios-arrow-back" />返回
                </a>
                <div class="head-name">编辑</div>
                <span></span>
                <a @click="close" class="window-close">
                    <Icon type="ios-close" size="31" class="ivu-icon-ios-close" />
                </a>
            </div>
        </div>
        <Form ref="form" :model="form" :label-width="100" :rules="formValidate" label-position="left">
            <FormItem label="资产" prop="assetName">
                <Input v-model="form.assetName" clearable style="width:570px" readonly />
                <assetChoose @on-change="getOneAssetData"></assetChoose>
            </FormItem>
            <FormItem label="发票单号" prop="invoice">
                <Input v-model="form.invoice" clearable style="width:570px" />
            </FormItem>
            <FormItem label="型号" prop="model">
                <Input v-model="form.model" style="width:570px" readonly />
            </FormItem>
            <FormItem label="单价" prop="unitPrice">
                <Input v-model="form.unitPrice" style="width:570px" readonly />
            </FormItem>
            <FormItem label="入库数量" prop="number">
                <InputNumber v-model="form.number" style="width:570px" @on-change="changeNumber" :min="0"></InputNumber>
            </FormItem>
            <FormItem label="总价">
                <Input v-model="form.totalPrice" style="width:570px" readonly />
            </FormItem>
            <FormItem label="备注" prop="remarks">
                <Input v-model="form.remarks" clearable style="width:570px" />
            </FormItem>
            <Form-item class="br">
                <Button @click="handleSubmit" :loading="submitLoading" type="primary">提交并保存</Button>
                <Button @click="handleReset">重置</Button>
                <Button type="dashed" @click="close">关闭</Button>
            </Form-item>
        </Form>
    </Card>
</div>
</template>

<script>
import {
    editWarehousing
} from "./api2.js";
import assetChoose from './assetChoose2.vue';
export default {
    name: "edit",
    components: {
        assetChoose,
    },
    props: {
        data: Object
    },
    data() {
        return {
            submitLoading: false, // 表单提交状态
            form: { // 添加或编辑表单对象初始化数据
                assetId: "",
                assetName: "",
                invoice: "",
                nature: "耗材",
                number: "0.0",
                remarks: "",
                model: "",
            },
            // 表单验证规则
            formValidate: {
                assetName: [{
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
                invoice: [{
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
                number: [{
                    type: "number",
                    required: true,
                    message: "不能为空",
                    trigger: "blur"
                }],
            }
        };
    },
    methods: {
        init() {
            this.handleReset();
            this.form = this.data;
            if (this.form.unitPrice != undefined && this.form.unitPrice != null) {
                this.form.totalPrice = parseFloat(this.form.unitPrice) * parseFloat(this.form.number);
            }
        },
        changeNumber(e) {
            if (this.form.unitPrice != undefined && this.form.unitPrice != null) {
                this.form.totalPrice = parseFloat(this.form.unitPrice) * parseFloat(this.form.number);
            }
        },
        getOneAssetData(e) {
            this.form.assetName = e.assetName;
            this.form.assetId = e.id;
            this.form.model = e.model;
            this.form.unitPrice = e.unitPrice;
            this.form.totalPrice = parseFloat(this.form.unitPrice) * parseFloat(this.form.number);
        },
        handleReset() {
            this.$refs.form.resetFields();
        },
        handleSubmit() {
            this.$refs.form.validate(valid => {
                if (valid) {
                    editWarehousing(this.form).then(res => {
                        this.submitLoading = false;
                        if (res.success) {
                            this.$Message.success("操作成功");
                            this.submited();
                        }
                    });
                }
            });
        },
        close() {
            this.$emit("close", true);
        },
        submited() {
            this.$emit("submited", true);
        }
    },
    mounted() {
        this.init();
    }
};
</script>

<style lang="less">
// 建议引入通用样式 具体路径自行修改 可删除下面样式代码
// @import "../../../styles/single-common.less";
.edit-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;

    .back-title {
        color: #515a6e;
        display: flex;
        align-items: center;
    }

    .head-name {
        display: inline-block;
        height: 20px;
        line-height: 20px;
        font-size: 16px;
        color: #17233d;
        font-weight: 500;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .window-close {
        z-index: 1;
        font-size: 12px;
        position: absolute;
        right: 0px;
        top: -5px;
        overflow: hidden;
        cursor: pointer;

        .ivu-icon-ios-close {
            color: #999;
            transition: color .2s ease;
        }
    }

    .window-close .ivu-icon-ios-close:hover {
        color: #444;
    }
}
</style>
