package programmerzamannow.jpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.*;
import programmerzamannow.jpa.util.JpaUtil;

import java.time.LocalDateTime;

public class InheritanceTest {

    @Test
    void singleTableInsert() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Employee employee = new Employee();
        employee.setId("khannedy");
        employee.setName("Khannedy");
        entityManager.persist(employee);

        Manager manager1 = new Manager();
        manager1.setId("budianto");
        manager1.setName("Budianto");
        manager1.setTotalEmployee(10);
        entityManager.persist(manager1);

        VicePresident vicePresident = new VicePresident();
        vicePresident.setId("joko");
        vicePresident.setName("Joko");
        vicePresident.setTotalManager(5);
        entityManager.persist(vicePresident);


        entityTransaction.commit();
    }

    @Test
    void singleTableFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Employee employee = entityManager.find(Employee.class, "khannedy");
        System.out.println(employee.getName());


        Manager manager = (Manager) entityManager.find(Employee.class, "budianto");
        ;
        System.out.println(manager.getName());


        VicePresident vp = (VicePresident) entityManager.find(Employee.class, "joko");
        System.out.println(vp.getName());

        entityTransaction.commit();
    }

    @Test
    void joinedTableInsert() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        PaymentGopay gopay = new PaymentGopay();
        gopay.setId("gopay1");
        gopay.setAmount(100_000L);
        gopay.setGopayId("0899999999");
        entityManager.persist(gopay);

        PaymentCreditCard creditCard = new PaymentCreditCard();
        creditCard.setId("cc1");
        creditCard.setAmount(500_000L);
        creditCard.setMaskedCard("4555-5555");
        creditCard.setBank("BCA");
        entityManager.persist(creditCard);

        entityTransaction.commit();
    }

    @Test
    void joinedTableFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        PaymentGopay gopay = entityManager.find(PaymentGopay.class, "gopay1");
        Assertions.assertEquals(100_000L, gopay.getAmount());

        PaymentCreditCard creditCard = entityManager.find(PaymentCreditCard.class, "cc1");
        Assertions.assertEquals(500_000L, creditCard.getAmount());


        entityTransaction.commit();
    }

    @Test
    void tablePerClassInsert() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Transaction transaction = new Transaction();
        transaction.setId("t1");
        transaction.setBalance(100_000_000L);
        transaction.setCreatedAt(LocalDateTime.now());
        entityManager.persist(transaction);

        TransactionCredit transactionCredit = new TransactionCredit();
        transactionCredit.setId("t2");
        transactionCredit.setBalance(20_000_000L);
        transactionCredit.setCreatedAt(LocalDateTime.now());
        transactionCredit.setCreditAmount(15_000_000L);
        entityManager.persist(transactionCredit);

        TransactionDebit transactionDebit = new TransactionDebit();
        transactionDebit.setId("t3");
        transactionDebit.setBalance(10_000_000L);
        transactionDebit.setCreatedAt(LocalDateTime.now());
        transactionDebit.setDebitAmount(2_000_000L);
        entityManager.persist(transactionDebit);


        entityTransaction.commit();
    }

    @Test
    void tablePerClassFind() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Transaction transaction = entityManager.find(Transaction.class, "t1");


        TransactionCredit transactionCredit = entityManager.find(TransactionCredit.class, "t2");


        TransactionDebit transactionDebit = entityManager.find(TransactionDebit.class, "t3");

        entityTransaction.commit();
    }

    @Test
    void mappedSuperclass() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Brand brand = new Brand();
        brand.setId("002");
        brand.setName("Xiaomi");
        brand.setDescription("Gadget Murah Dari China");
        brand.setCreatedAt(LocalDateTime.now());
        brand.setUpdatedAt(LocalDateTime.now());
        entityManager.persist(brand);

        entityTransaction.commit();
    }
}
