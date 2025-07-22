package programmerzamannow.jpa.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "brands")
@EntityListeners({
        UpdatedAtListener.class,
        CreatedAtListener.class,
})
@NamedQueries({
        @NamedQuery(name = "Brand.findAll", query = "select b from Brand b"),
        @NamedQuery(name = "Brand.findAllByName", query = "select b from Brand b where b.name = :name")
})
@NamedNativeQueries({
        @NamedNativeQuery(name = "Brand.native.findAll", query = "select * from brands where created_at is not null", resultClass = Brand.class)
})
@Getter
@Setter
@NoArgsConstructor
public class Brand extends AuditableEntity<String> implements UpdatedAtAware, CreatedAtAware {

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "brand")
    private List<Product> product;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Version
    private Long version;
}
