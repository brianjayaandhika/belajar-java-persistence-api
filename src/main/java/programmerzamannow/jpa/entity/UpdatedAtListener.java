package programmerzamannow.jpa.entity;

import jakarta.persistence.PostPersist;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

import java.time.LocalDateTime;

public class UpdatedAtListener {

    @PrePersist
    @PreUpdate
    void setLastUpdatedAt(UpdatedAtAware object) {
        object.setUpdatedAt(LocalDateTime.now());
    }
}
