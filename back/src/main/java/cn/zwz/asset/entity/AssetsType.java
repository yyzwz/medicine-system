package cn.zwz.asset.entity;

import cn.zwz.basics.baseClass.ZwzBaseEntity;
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
@Table(name = "t_assets_type")
@TableName("t_assets_type")
@ApiModel(value = "资产种类")
public class AssetsType extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "资产名称")
    private String assetName;

    @ApiModelProperty(value = "性质")
    private String nature;

    @ApiModelProperty(value = "型号")
    private String model;

    @ApiModelProperty(value = "数量")
    private String number;

    @ApiModelProperty(value = "现有数量")
    private String existingNumber;

    @ApiModelProperty(value = "单价")
    private String unitPrice;

    @ApiModelProperty(value = "总价")
    private String totalPrice;

    @ApiModelProperty(value = "备注")
    private String remarks;
}