package programmerzamannow.jpa.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "employees")
@DiscriminatorColumn(name = "type")
@DiscriminatorValue("EMPLOYEE")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

    @Id
    private String id;

    private String name;
}
