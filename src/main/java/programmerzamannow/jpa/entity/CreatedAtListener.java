package programmerzamannow.jpa.entity;

import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;

import java.time.LocalDateTime;

public class CreatedAtListener {

    @PrePersist
    void setLastCreatedAt(CreatedAtAware object) {
        object.setCreatedAt(LocalDateTime.now());
    }
}
