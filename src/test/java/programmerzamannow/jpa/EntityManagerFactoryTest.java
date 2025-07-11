package programmerzamannow.jpa;

import jakarta.persistence.EntityManagerFactory;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.util.JpaUtil;

public class EntityManagerFactoryTest {

    @Test
    void create() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        Assertions.assertNotNull(entityManagerFactory);
    }
}
