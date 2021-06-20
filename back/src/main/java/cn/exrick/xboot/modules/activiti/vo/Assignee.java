package cn.exrick.xboot.modules.activiti.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Exrick
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Assignee {

    private String nickname;

    private String username;

    private Boolean isExecutor;
}
