package programmerzamannow.jpa.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "customers")
@Getter
@Setter
@NoArgsConstructor
public class Customer {


    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "primary_email")
    private String primaryEmail;

    @Column(name = "married")
    private Boolean married;

    @Column(name = "age")
    private Byte age;

    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    private CustomerType type;

    @Transient // does not affect table
    private String fullName;
}
