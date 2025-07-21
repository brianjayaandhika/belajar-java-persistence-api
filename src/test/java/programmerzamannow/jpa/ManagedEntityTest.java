package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.LockModeType;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Brand;
import programmerzamannow.jpa.util.JpaUtil;

public class ManagedEntityTest {

    @Test
    void managedEntityTest() throws InterruptedException {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = new Brand();
        brand.setId("004");
        brand.setName("Apple");
        brand.setDescription("Apple Apple Apple");

        entityManager.persist(brand);

        Thread.sleep(5 * 1000L);
        brand.setName("Apple International");

        entityTransaction.commit();
    }

    @Test
    void managedEntityFindTest() throws InterruptedException {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = entityManager.find(Brand.class, "004");

        brand.setName("Apple Co International");

        entityTransaction.commit();
    }

    @Test
    void managedEntityDetach() throws InterruptedException {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = entityManager.find(Brand.class, "004");
        entityManager.detach(brand);

        brand.setName("Apple Indonesia");

        entityTransaction.commit();
    }
}
