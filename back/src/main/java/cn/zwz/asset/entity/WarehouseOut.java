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

/**
 * @author 郑为中
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "t_warehouse_out")
@TableName("t_warehouse_out")
@ApiModel(value = "出库管理")
public class WarehouseOut extends ZwzBaseEntity {

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
    private String unitPrice;

    @ApiModelProperty(value = "数量")
    private String number;

    @ApiModelProperty(value = "备注")
    private String remarks;

    @TableField(exist=false)
    @ApiModelProperty(value = "现在还有的数量")
    private String existNumber;

}