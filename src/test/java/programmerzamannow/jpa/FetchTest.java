package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Credential;
import programmerzamannow.jpa.entity.Product;
import programmerzamannow.jpa.entity.User;
import programmerzamannow.jpa.entity.Wallet;
import programmerzamannow.jpa.util.JpaUtil;

public class FetchTest {

    @Test
    void fetch() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Product product = entityManager.find(Product.class, "p1");

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
        Assertions.assertEquals(5_000_000, user.getWallet().getBalance());


        entityTransaction.commit();
    }

    @Test
    void OneToOneJoinColumn() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        User user = entityManager.find(User.class, "001");

        Wallet wallet = new Wallet();
        wallet.setBalance(5_000_000);
        wallet.setUser(user);
        entityManager.persist(wallet);

        entityTransaction.commit();
    }
}
