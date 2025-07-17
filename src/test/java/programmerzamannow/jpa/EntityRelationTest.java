package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Credential;
import programmerzamannow.jpa.entity.User;
import programmerzamannow.jpa.util.JpaUtil;

public class EntityRelationTest {

    @Test
    void OneToOneCreate() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Credential credential = new Credential();

        credential.setId("001");
        credential.setEmail("khannedy@email.com");
        credential.setPassword("1234");
        entityManager.persist(credential);

        User user = new User();
        user.setId("001");
        user.setName("Eko Khannedy");
        user.setCredential(credential);
        entityManager.persist(user);

        entityTransaction.commit();

    }

    @Test
    void OneToOneFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        User user = entityManager.find(User.class, "001");

        Assertions.assertNotNull(user.getCredential());

        Assertions.assertEquals("khannedy@email.com", user.getCredential().getEmail());
        Assertions.assertEquals("1234", user.getCredential().getPassword());

        entityTransaction.commit();
    }
}
