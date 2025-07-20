package programmerzamannow.jpa.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@DiscriminatorValue("MANAGER")
@Getter
@Setter
public class Manager extends Employee {

    @Column(name = "total_employee")
    private Integer totalEmployee;
}
