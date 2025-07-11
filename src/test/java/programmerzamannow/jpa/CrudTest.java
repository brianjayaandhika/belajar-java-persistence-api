package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Customer;
import programmerzamannow.jpa.util.JpaUtil;

@Slf4j
public class CrudTest {

    @Test
    void insert() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        Assertions.assertNotNull(entityTransaction);

        try {
            entityTransaction.begin();
            // operasi database

            Customer customer = new Customer();

            customer.setId("1");
            customer.setName("Eko");

            entityManager.persist(customer);

            entityTransaction.commit();
        } catch (Throwable e) {
            log.info("Rollback Called - " + e.getMessage());
            entityTransaction.rollback();
        }
    }

    @Test
    void find() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        Assertions.assertNotNull(entityTransaction);

            entityTransaction.begin();
            // operasi database

            Customer customer = entityManager.find(Customer.class, "1");

            Assertions.assertEquals("Eko", customer.getName());
            Assertions.assertEquals("1", customer.getId());
            Assertions.assertNotEquals("2", customer.getId());


            entityTransaction.commit();
    }

    @Test
    void update() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        Assertions.assertNotNull(entityTransaction);

        entityTransaction.begin();
        // operasi database

        Customer customer = entityManager.find(Customer.class, "1");

        Assertions.assertEquals("Eko", customer.getName());
        Assertions.assertEquals("1", customer.getId());
        Assertions.assertNotEquals("2", customer.getId());

        customer.setName("Eko Kurnia");
        entityManager.merge(customer);

        Assertions.assertEquals("Eko Kurnia", customer.getName());
        Assertions.assertNotEquals("Eko", customer.getName());


        entityTransaction.commit();
    }

    @Test
    void remove() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        Assertions.assertNotNull(entityTransaction);

        try {
            entityTransaction.begin();

            Customer customer = new Customer();
            customer.setId("999");
            customer.setName("Test Data");

            entityManager.persist(customer);

            Assertions.assertEquals("999", customer.getId());
            Assertions.assertEquals("Test Data", customer.getName());

            Customer customer2 = entityManager.find(Customer.class, "999");

            Assertions.assertEquals("999", customer2.getId());
            Assertions.assertEquals("Test Data", customer2.getName());

            entityManager.remove(customer2);

            entityManager.flush();
            entityManager.clear();

            Customer deletedCustomer = entityManager.find(Customer.class, "999");
            Assertions.assertNull(deletedCustomer); // ✅ Correct check

            entityTransaction.commit();
        } catch (Throwable e) {
            entityTransaction.rollback();
            throw new IllegalArgumentException("Rollback Called - " + e.getMessage());
        }
    }
}
