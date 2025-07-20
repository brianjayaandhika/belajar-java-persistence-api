package programmerzamannow.jpa.entity;

import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@DiscriminatorValue("VP")
@Getter
@Setter
public class VicePresident extends Manager {

    @Column(name = "total_manager")
    private Integer totalManager;
}
