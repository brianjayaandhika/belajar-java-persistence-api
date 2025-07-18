package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.*;
import programmerzamannow.jpa.util.JpaUtil;

public class EntityRelationManyToOneTest {

    @Test
    void OneToOneCreate() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = new Brand();

        brand.setId("001");
        brand.setName("Honda");
        brand.setDescription("Honda semakin didepan");
        entityManager.persist(brand);

        Product product = new Product();
        product.setId("001");
        product.setName("Vario 160");
        product.setPrice(18_000_000);
        product.setDescription("Vario 2025 160cc");
        product.setBrand(brand);

//        Product product2 = new Product("002", brand, "Beat", 16_000_000, "Beat 2025 120cc");

        entityManager.persist(product);
//        entityManager.persist(product2);

        entityTransaction.commit();

    }

    @Test
    void OneToOneFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = entityManager.find(Brand.class, "001");

        Assertions.assertEquals(2, brand.getProduct().size());

        for (Product product : brand.getProduct()) {
            System.out.println(product.getName());
        }

        entityTransaction.commit();
    }
}
