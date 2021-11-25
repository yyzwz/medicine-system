package cn.zwz.modules.insurance.entity;

import cn.zwz.base.XbootBaseEntity;
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
@Table(name = "t_insurance")
@TableName("t_insurance")
@ApiModel(value = "医疗保险")
public class Insurance extends XbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "保险名称")
    private String name;

    @ApiModelProperty(value = "自费门诊百分比")
    private String mine;

    @ApiModelProperty(value = "普通门诊百分比")
    private String common;

    @ApiModelProperty(value = "大病门诊百分比")
    private String big;

    @ApiModelProperty(value = "一类药报销百分比")
    private String one;

    @ApiModelProperty(value = "二类药报销百分比")
    private String two;

    @ApiModelProperty(value = "三类药报销百分比")
    private String three;
}