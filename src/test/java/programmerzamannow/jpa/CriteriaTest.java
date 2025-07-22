package programmerzamannow.jpa;

import jakarta.persistence.*;
import jakarta.persistence.criteria.*;
import lombok.Cleanup;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.Brand;
import programmerzamannow.jpa.entity.Product;
import programmerzamannow.jpa.entity.SimpleBrand;
import programmerzamannow.jpa.util.JpaUtil;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class CriteriaTest {

    @Test
    void criteria() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        CriteriaQuery<Brand> query = builder.createQuery(Brand.class);
        Root<Brand> root = query.from(Brand.class);
        query.select(root);

        TypedQuery<Brand> query1 = entityManager.createQuery(query);
        for (Brand brand : query1.getResultList()) {
            System.out.println(brand.getName());
        }


        entityTransaction.commit();
    }

    @Test
    void criteriaNonEntity() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root<Brand> root = query.from(Brand.class);
        query.select(builder.array(root.get("id"), root.get("name"), root.get("createdAt")));

        TypedQuery<Object[]> query1 = entityManager.createQuery(query);
        for (Object[] object : query1.getResultList()) {
            System.out.println(object[0] + ": " + object[1] + " - " + object[2]);
        }


        entityTransaction.commit();
    }

    @Test
    void criteriaQueryConstructor() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();

        CriteriaQuery<SimpleBrand> query = builder.createQuery(SimpleBrand.class);
        Root<Brand> root = query.from(Brand.class);
        query.select(builder.construct(SimpleBrand.class, root.get("id"), root.get("name")));

        TypedQuery<SimpleBrand> query1 = entityManager.createQuery(query);

        for (SimpleBrand object : query1.getResultList()) {
            System.out.println(object.getId() + ": " + object.getName());
        }


        entityTransaction.commit();
    }

    @Test
    void criteriaWhereClause() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Brand> query = builder.createQuery(Brand.class);
        Root<Brand> root = query.from(Brand.class);

        query.where(builder.or(builder.equal(root.get("name"), "Xiaomi"), builder.equal(root.get("name"), "Nokia")), builder.isNotNull(root.get("createdAt")));

        TypedQuery<Brand> query1 = entityManager.createQuery(query);

        for (Brand object : query1.getResultList()) {
            System.out.println(object.getId() + ": " + object.getName() + " - " + object.getCreatedAt());
        }


        entityTransaction.commit();
    }

    @Test
    void criteriaJoinClause() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root<Product> root = query.from(Product.class);
        Join<Product, Brand> brand = root.join("brand");

        query.select(root);
        query.where(builder.equal(brand.get("name"), "Honda Updated"));

        TypedQuery<Product> query1 = entityManager.createQuery(query);

        for (Product object : query1.getResultList()) {
            System.out.println(object.getName());
        }


        entityTransaction.commit();
    }

    @Test
    void criteriaParameter() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> query = builder.createQuery(Product.class);
        Root<Product> root = query.from(Product.class);
        Join<Product, Brand> brand = root.join("brand");

        ParameterExpression<String> parameter = builder.parameter(String.class);

        query.select(root);
        query.where(builder.equal(brand.get("name"), parameter));

        TypedQuery<Product> query1 = entityManager.createQuery(query);
        query1.setParameter(parameter, "Honda Updated");

        for (Product object : query1.getResultList()) {
            System.out.println(object.getName());
        }


        entityTransaction.commit();
    }

    @Test
    void criteriaAggregate() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Object[]> criteria = builder.createQuery(Object[].class);
        Root<Product> p = criteria.from(Product.class);
        Join<Product, Brand> b = p.join("brand");


        criteria.select(builder.array(b.get("name"), builder.min(p.get("price")), builder.max(p.get("price")), builder.avg(p.get("price"))));
        criteria.groupBy(b.get("id"));
        criteria.having(builder.greaterThan(builder.min(p.get("price")), 500_000L));

        TypedQuery<Object[]> query1 = entityManager.createQuery(criteria);

        for (Object[] object : query1.getResultList()) {
            System.out.println("Brand: " + object[0]);
            System.out.println("Min: " + object[1]);
            System.out.println("Max: " + object[2]);
            System.out.println("Average: " + object[3]);
        }


        entityTransaction.commit();
    }

    @Test
    void criteriaUpdate() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaUpdate<Brand> criteria = builder.createCriteriaUpdate(Brand.class);
        Root<Brand> b = criteria.from(Brand.class);

        criteria.set(b.get("name"), "Xiaomi Updated");
        criteria.set(b.get("description"), "Xiaomi Company");

        criteria.where(
                builder.equal(b.get("name"), "Xiaomi")
        );

        Query query = entityManager.createQuery(criteria);
        int rowUpdated = query.executeUpdate();

        System.out.println("Row Impacted: " + rowUpdated);


        entityTransaction.commit();
    }
}
