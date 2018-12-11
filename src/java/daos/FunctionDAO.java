/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Ignatius
 */
public class FunctionDAO {

    private SessionFactory factory;
    private Session session;
    private Transaction transaction;

    public FunctionDAO() {
    }

    public FunctionDAO(SessionFactory factory) {
        this.factory = factory;
    }

    /**
     * Fungsi untuk melakukan insert atau update Region
     *
     * @param region
     * @param isDelete
     * @return
     */
    public boolean insertOrUpdateOrDelete(Object object,
            boolean isDelete) {
        boolean result = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            if (isDelete) {
                session.delete(object);
            } else {
                session.saveOrUpdate(object);
            }
            result = true;
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    /**
     *
     * @param query
     * @return
     */
    public List<Object> getDatas(Object entities, String key) {
        List<Object> rs = new ArrayList<>();
        String className = entities.getClass().getSimpleName();
        className = className.substring(className.indexOf(".") + 1);
        String query = "From " + className;
        if (!key.equals("")) {
            query = getQuery(entities, key, query);
        }
        query += " ORDER BY 1";
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            rs = session.createQuery(query).list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return rs;
    }

    public String getQuery(Object entity, String key, String query) {
        String className = entity.getClass().getName();
        query += " WHERE ";
        for (Object r : entity.getClass().getDeclaredFields()) {
            String field = r + "";
            if (!field.contains("UID") && !field.contains("List")) {
                field = field.substring(field.lastIndexOf(".") + 1);
                query += field + " LIKE '%" + key + "%' OR ";
            }
        }
        query = query.substring(0, query.lastIndexOf("OR"));

        return query;
    }

    /**
     *
     * @param query
     * @return
     */
    public Object getById(Object table, Object id) {
        Object object = new Object();
        String className = table.getClass().getName();
        String classNames = className.substring(className.indexOf(".") + 1);
        className = classNames.replace("s", "");
        String query = "FROM " + classNames + " where " + className.toLowerCase() +"Id =" + id ;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }

    public boolean insImg(int paramIndex, InputStream stream, long length) {
        boolean hasil = false;
        Object object = new Object();
        try {
            String query = "insert into IMGTABLE values(?,?)";
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.createQuery(query).uniqueResult();
            FileInputStream fin = new FileInputStream("C:\\Users\\Nitani\\Pictures\\Capture.png");
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hasil;
    }
    
    public List<Object> getDatasId(Object entities, String key) {
        List<Object> rs = new ArrayList<>();
        String className = entities.getClass().getSimpleName();
        className = className.substring(className.indexOf(".") + 1);
        String query = "From " + className + " where USER_PROFILE_ID=" + key;
        System.out.println(query);
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            rs = session.createQuery(query).list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return rs;
    }
}
