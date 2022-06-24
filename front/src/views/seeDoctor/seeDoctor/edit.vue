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
            <FormItem label="用户ID" prop="userId">
                <Input v-model="form.userId" readonly style="width:570px" />
            </FormItem>
            <FormItem label="用户名" prop="userName">
                <Input v-model="form.userName" readonly style="width:570px" />
            </FormItem>
            <FormItem label="药物" prop="medicineName">
                <Input v-model="form.medicineName" readonly style="width:570px" />
            </FormItem>
            <FormItem label="保险名称" prop="name">
                <Input v-model="form.name" readonly style="width:570px" />
            </FormItem>
            <FormItem label="原余额" prop="balance">
                <InputNumber v-model="form.balance" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="门诊类型" prop="type">
                <Input v-model="form.type" readonly style="width:570px" />
            </FormItem>
            <FormItem label="诊断原价" prop="priceOld">
                <InputNumber v-model="form.priceOld" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="诊断抵扣" prop="priceYou">
                <InputNumber v-model="form.priceYou" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="诊断费用" prop="price">
                <InputNumber v-model="form.price" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="看病日期" prop="date">
                <Input v-model="form.date" readonly style="width:570px" />
            </FormItem>
            <FormItem label="药物费用" prop="medicinePrice">
                <InputNumber v-model="form.medicinePrice" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="药物原价" prop="medicineOld">
                <InputNumber v-model="form.medicineOld" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="药物优惠" prop="priceDiscount">
                <InputNumber v-model="form.priceDiscount" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="费用总计" prop="priceSum">
                <InputNumber v-model="form.priceSum" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <FormItem label="节余" prop="balanceNew">
                <InputNumber v-model="form.balanceNew" readonly min="0" max="5000000" style="width:570px"></InputNumber>
            </FormItem>
            <Form-item class="br">
                <Button type="dashed" @click="close">关闭</Button>
            </Form-item>
        </Form>
    </Card>
</div>
</template>

<script>
import {
    editSeeDoctor
} from "./api.js";
export default {
    name: "edit",
    components: {},
    props: {
        data: Object
    },
    data() {
        return {
            submitLoading: false, // 表单提交状态
            form: { // 添加或编辑表单对象初始化数据
                userId: "",
                userName: "",
                medicineName: "",
                name: "",
                balance: 0,
                type: "",
                priceOld: 0,
                priceYou: 0,
                price: 0,
                date: "",
                medicinePrice: 0,
                medicineOld: 0,
                priceDiscount: 0,
                priceSum: 0,
                balanceNew: 0,
            },
            // 表单验证规则
            formValidate: {}
        };
    },
    methods: {
        init() {
            this.handleReset();
            this.form = this.data;
        },
        handleReset() {
            this.$refs.form.resetFields();
        },
        handleSubmit() {
            this.$refs.form.validate(valid => {
                if (valid) {
                    editSeeDoctor(this.form).then(res => {
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
