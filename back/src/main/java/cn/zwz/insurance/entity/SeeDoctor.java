package cn.zwz.insurance.entity;

import cn.zwz.basics.baseClass.ZwzBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author 郑为中
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "a_see_doctor")
@TableName("a_see_doctor")
@ApiModel(value = "看病单")
public class SeeDoctor extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户ID")
    private String userId;

    @ApiModelProperty(value = "用户名")
    private String userName;

    @ApiModelProperty(value = "药物")
    private String medicineName;

    @ApiModelProperty(value = "保险名称")
    private String name;

    @ApiModelProperty(value = "原余额")
    private BigDecimal balance;

    @ApiModelProperty(value = "门诊类型")
    private String type;

    @ApiModelProperty(value = "诊断原价")
    private BigDecimal priceOld;

    @ApiModelProperty(value = "诊断抵扣")
    private BigDecimal priceYou;

    @ApiModelProperty(value = "诊断费用")
    private BigDecimal price;

    @ApiModelProperty(value = "看病日期")
    private String date;

    @ApiModelProperty(value = "药物费用")
    private BigDecimal medicinePrice;

    @ApiModelProperty(value = "药物原价")
    private BigDecimal medicineOld;

    @ApiModelProperty(value = "药物优惠")
    private BigDecimal priceDiscount;

    @ApiModelProperty(value = "费用总计")
    private BigDecimal priceSum;

    @ApiModelProperty(value = "节余")
    private BigDecimal balanceNew;
}