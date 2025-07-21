package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.LockModeType;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Brand;
import programmerzamannow.jpa.util.JpaUtil;

import java.time.LocalDateTime;

public class LockingTest {

    @Test
    void optimisticLocking() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = new Brand();
        brand.setId("003");
        brand.setName("Nokia");
        brand.setDescription("Gadget Bata");
        brand.setCreatedAt(LocalDateTime.now());
        brand.setUpdatedAt(LocalDateTime.now());
        entityManager.persist(brand);

        entityTransaction.commit();
    }

    @Test
    void optimisticLockingUpdate() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = entityManager.find(Brand.class, "003");
        brand.setDescription("Brand New Gadget");
        entityManager.persist(brand);

        entityTransaction.commit();
    }

    @Test
    void pesimisticLockingDemo1() throws InterruptedException {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = entityManager.find(Brand.class, "003", LockModeType.PESSIMISTIC_WRITE);
        brand.setDescription("Brand Nokia New Gadget");

        Thread.sleep(10 * 1000L);
        entityManager.persist(brand);

        entityTransaction.commit();
    }

    @Test
    void pesimisticLockingDemo2() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = entityManager.find(Brand.class, "003", LockModeType.PESSIMISTIC_WRITE);
        brand.setDescription("Brand Nokia New Gadget Demo 2");
        entityManager.persist(brand);

        entityTransaction.commit();
    }
}
