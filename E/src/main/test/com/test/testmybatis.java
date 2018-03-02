package com.test;

import com.dao.IKeshiDao;
import com.entity.Keshi;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;

public class testmybatis {

    @Test
    public void test01() throws IOException {

        SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config"));
        SqlSession sqlSession = sqlSessionFactory.openSession();

          IKeshiDao iKeshiDao=sqlSession.getMapper(IKeshiDao.class);
        for (Keshi keshi : iKeshiDao.getall()) {
            System.out.println(keshi);
        }

    }


}
