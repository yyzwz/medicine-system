package cn.zwz.asset.entity;

import cn.zwz.basics.baseClass.ZwzBaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
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
@Table(name = "a_outbound_order")
@TableName("a_outbound_order")
@ApiModel(value = "医疗资产出库单")
public class MedicalAssetsOutboundOrder extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "资产ID")
    private String assetId;

    @ApiModelProperty(value = "资产名称")
    private String assetName;

    @ApiModelProperty(value = "领用人")
    private String recipients;

    @ApiModelProperty(value = "领用人ID")
    private String recipientsId;

    @ApiModelProperty(value = "性质")
    private String nature;

    @ApiModelProperty(value = "型号")
    private String model;

    @ApiModelProperty(value = "单价")
    private BigDecimal unitPrice;

    @ApiModelProperty(value = "数量")
    private BigDecimal number;

    @ApiModelProperty(value = "备注")
    private String remarks;

    @TableField(exist=false)
    @ApiModelProperty(value = "现在还有的数量")
    private BigDecimal existNumber;
}