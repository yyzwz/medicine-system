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

/**
 * @author 郑为中
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "t_roster")
@TableName("t_roster")
@ApiModel(value = "参保人员")
public class Roster extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "姓名")
    private String name;

    @ApiModelProperty(value = "性别")
    private String sex;

    @ApiModelProperty(value = "出生地")
    private String nativePlace;

    @ApiModelProperty(value = "年龄")
    private String age;

    @ApiModelProperty(value = "家庭地址")
    private String address;

    @ApiModelProperty(value = "电话号码")
    private String mobile;

    @ApiModelProperty(value = "身份证号码")
    private String identity;

    @ApiModelProperty(value = "社保卡号")
    private String cardNumber;

    @ApiModelProperty(value = "余额")
    private String balance;

    @ApiModelProperty(value = "保险类型")
    private String insuranceType;

    @ApiModelProperty(value = "保险名")
    private String insuranceName;

    @ApiModelProperty(value = "参保情况")
    private String status;
}