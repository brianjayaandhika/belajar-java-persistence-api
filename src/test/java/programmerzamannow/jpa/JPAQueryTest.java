package programmerzamannow.jpa;

import jakarta.persistence.*;
import lombok.Cleanup;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import programmerzamannow.jpa.entity.*;
import programmerzamannow.jpa.util.JpaUtil;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

public class JPAQueryTest {

    @Test
    void select() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Brand> query = entityManager.createQuery("select b from Brand b", Brand.class);
        List<Brand> brands = query.getResultList();

        for (Brand brand : brands) {
            System.out.println(brand.getName());
        }

        entityTransaction.commit();
    }

    @Test
    void selectWhere() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Member> query = entityManager.createQuery("select m from Member m where m.name.firstName = :firstName" + " and m.name.lastName = :lastName", Member.class);
        query.setParameter("firstName", "Eko");
        query.setParameter("lastName", "Khannedy");

        List<Member> members = query.getResultList();

        for (Member member : members) {
            System.out.println(member.getFullName());
        }

        entityTransaction.commit();
    }

    @Test
    void selectJoin() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Product> query = entityManager.createQuery("select p from Product p join p.brand b where b.name = :brand ", Product.class);
        query.setParameter("brand", "Honda");

        List<Product> products = query.getResultList();

        for (Product product : products) {
            System.out.println(product.getName() + " - " + product.getBrand().getName());
        }

        entityTransaction.commit();
    }

    @Test
    void selectJoinFetch() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<User> query = entityManager.createQuery("select u from User u join fetch u.likes p where p.name = :product ", User.class);
        query.setParameter("product", "Beat");

        List<User> users = query.getResultList();

        for (User user : users) {
            System.out.println("User: " + user.getName());

            for (Product product : user.getLikes()) {
                System.out.println("Product: " + product.getName());
            }
        }

        entityTransaction.commit();
    }

    @Test
    void OrderByClause() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Brand> query = entityManager.createQuery("select b from Brand b order by b.name desc", Brand.class);

        List<Brand> brands = query.getResultList();

        for (Brand brand : brands) {
            System.out.println("Brand: " + brand.getName());

        }

        entityTransaction.commit();
    }

    @Test
    void limitOffsetClause() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Brand> query = entityManager.createQuery("select b from Brand b order by b.name desc", Brand.class);
        query.setFirstResult(2); // offset by n data
        query.setMaxResults(2); // limit n data

        List<Brand> brands = query.getResultList();

        for (Brand brand : brands) {
            System.out.println("Brand: " + brand.getName());
        }

        entityTransaction.commit();
    }

    @Test
    void namedQuery() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Brand> query = entityManager.createNamedQuery("Brand.findAllByName", Brand.class);

        List<Brand> brands = query.getResultList();

        for (Brand brand : brands) {
            System.out.println("Brand: " + brand.getName());
        }

        entityTransaction.commit();
    }

    @Test
    void selectSomeFields() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Object[]> query = entityManager.createQuery("select b.id, b.name from Brand b", Object[].class);

        List<Object[]> list = query.getResultList();

        for (Object[] object : list) {
            System.out.println(object[0] + ":" + object[1]);
        }

        entityTransaction.commit();
    }

    @Test
    void selectNewConstructor() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<SimpleBrand> query = entityManager.createQuery("select new programmerzamannow.jpa.entity.SimpleBrand(b.id, b.name)" + " from Brand b where b.name = :name", SimpleBrand.class);
        query.setParameter("name", "Xiaomi");

        List<SimpleBrand> simpleBrands = query.getResultList();

        for (SimpleBrand brand : simpleBrands) {
            System.out.println(brand.getId() + ": " + brand.getName());
        }

        entityTransaction.commit();
    }

    @Test
    void aggregateFunction() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Object[]> query = entityManager.createQuery("select max(p.price), min(p.price), avg(p.price), count(p)" + " from Product p", Object[].class);
        Object[] result = query.getSingleResult();

        System.out.println("Max: " + result[0]);
        System.out.println("Min: " + result[1]);
        System.out.println("Avg: " + result[2]);
        System.out.println("Count: " + result[3]);

        entityTransaction.commit();
    }

    @Test
    void groupByClause() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Object[]> query = entityManager.createQuery("select b.name ,max(p.price), min(p.price), avg(p.price), count(p)" + " from Product p join p.brand b group by b.id having min(p.price) > :min", Object[].class);
        query.setParameter("min", 1_000_000L);
        List<Object[]> list = query.getResultList();

        for (Object[] x : list) {
            System.out.println("Brand: " + x[0]);
            System.out.println("Max: " + x[1]);
            System.out.println("Min: " + x[2]);
            System.out.println("Avg: " + x[3]);
            System.out.println("Count: " + x[4]);
        }


        entityTransaction.commit();
    }

    @Test
    void nativeQuery() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Query query = entityManager.createNativeQuery("select * from brands where version is null", Brand.class);
        List<Brand> brands = query.getResultList();

        for (Brand x : brands) {
            System.out.println(x.getId() + ":" + x.getName());
        }


        entityTransaction.commit();
    }

    @Test
    void namedNativeQuery() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        TypedQuery<Brand> query = entityManager.createNamedQuery("Brand.native.findAll", Brand.class);
        List<Brand> brands = query.getResultList();


        for (Brand x : brands) {
            String dateTime = x.getCreatedAt().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            System.out.println(x.getId() + ":" + x.getName() + ":" + dateTime);
        }


        entityTransaction.commit();
    }

    @Test
    void updateQuery() {
        @Cleanup EntityManagerFactory entityManagerFactory = JpaUtil.getEntityManagerFactory();
        @Cleanup EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        entityTransaction.begin();

        Query query = entityManager.createQuery("update Brand b set b.name = :name where b.id = :id");
        query.setParameter("name", "Honda Updated");
        query.setParameter("id", "001");

        int rowImpacted = query.executeUpdate();

        System.out.println("Impacted Row: " + rowImpacted);

        entityTransaction.commit();
    }
}
