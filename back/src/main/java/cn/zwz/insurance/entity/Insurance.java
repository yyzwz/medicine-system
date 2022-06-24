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
@Table(name = "a_insurance")
@TableName("a_insurance")
@ApiModel(value = "医疗保险")
public class Insurance extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "医疗保险标题")
    private String title;

    @ApiModelProperty(value = "保险内容")
    private String content;

    @ApiModelProperty(value = "自费门诊百分比")
    private BigDecimal mine;

    @ApiModelProperty(value = "普通门诊百分比")
    private BigDecimal common;

    @ApiModelProperty(value = "大病门诊百分比")
    private BigDecimal big;

    @ApiModelProperty(value = "一类药报销百分比")
    private BigDecimal one;

    @ApiModelProperty(value = "二类药报销百分比")
    private BigDecimal two;

    @ApiModelProperty(value = "三类药报销百分比")
    private BigDecimal three;
}