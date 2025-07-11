package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.util.JpaUtil;

public class EntityManagerTest {

    @Test
    void create() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();

        // operasi database


        Assertions.assertNotNull(entityManagerFactory);
    }
}
