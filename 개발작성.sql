   -- 수정쿼리
   
		UPDATE
		        BOARD
		    SET BOARD_TITLE = '수정쿼리문 테스트중'
		        , BOARD_COMMENT = '오예'
		        , MODIFIED_TIME = TO_CHAR(SYSDATE)
		WHERE BOARD_NUM = 0
        AND BOARD_TYPE = 1
        ;


-- 조회
      SELECT 
		  BOARD_TYPE
		  ,BOARD_NUM
		  ,BOARD_TITLE
		  ,BOARD_COMMENT
		  ,TOTAL_CNT
		FROM 
		(
		  SELECT
		      	BOARD_TYPE
				,BOARD_NUM
				,BOARD_TITLE
				,BOARD_COMMENT
		      	,ROW_NUMBER() OVER(ORDER BY BOARD_NUM DESC) AS NUMROW
		      	,COUNT(*) OVER() AS TOTAL_CNT
			FROM
				BOARD	
		)
	;
    
    -- 삭제
    DELETE
    FROM BOARD
    WHERE BOARD_NUM = 5
    AND BOARD_TYPE = 1
    ;
    
    
      INSERT INTO 
        BOARD
        (BOARD_TYPE
        ,BOARD_NUM
        ,BOARD_TITLE
        ,BOARD_COMMENT
        ,CREATOR
        ,CREATE_TIME
        ,MODIFIER
        ,MODIFIED_TIME
        )
        VALUES
        ('1'
        ,( SELECT NVL(TO_NUMBER(MAX(BOARD_NUM)+1),1)
		FROM BOARD
		WHERE BOARD_TYPE = '1')
        ,'왜안되누'
        ,'뭐가문제구'
        ,'SYSTEM'
        ,TO_CHAR(SYSDATE)
        ,'SYSTEM'
        ,TO_CHAR(SYSDATE)
        )
        ;
        
        delete
        from board;
        
        commit;
        
        
        SELECT TO_NUMBER(MAX(NVL (BOARD_NUM,1))+1)
		FROM BOARD
		WHERE BOARD_TYPE = '1'
        ;
        
        SELECT NVL(TO_NUMBER(MAX(BOARD_NUM)+1),1)
		FROM BOARD
		WHERE BOARD_TYPE = '1'
        ;
        
        
        -- 회원 삽입
        
        INSERT INTO
		USER_INFO
		(USER_ID
		,USER_PW
		,USER_NAME
		,USER_PHONE1
		,USER_PHONE2
		,USER_PHONE3
		,USER_ADDR1
		,USER_ADDR2
		,USER_COMPANY
		,CREATOR
		,CREATE_TIME
		,MODIFIER
		,MODIFIED_TIME
		)
		VALUES
		(
		'admin'
        ,'asdfqwer'
        ,'관리자'
		,'010'
        ,'1111'
        ,'2222'
        ,'123-123'
        ,'아오 삽입힘들어'
        ,'천상계'
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		)
        ;
        
                INSERT INTO
		USER_INFO
		(USER_ID
		,USER_PW
		,USER_NAME
		,USER_PHONE1
		,USER_PHONE2
		,USER_PHONE3
		,USER_ADDR1
		,USER_ADDR2
		,USER_COMPANY
		,CREATOR
		,CREATE_TIME
		,MODIFIER
		,MODIFIED_TIME
		)
		VALUES
		(
		'apple'
        ,'asdfqwer'
        ,'사과농부'
		,'011'
        ,'3333'
        ,'4444'
        ,'3333-123'
        ,'아오 삽입힘들어'
        ,'천상계'
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		,'SYSTEM'
		,TO_CHAR(SYSDATE)
		)
        ;
        
        
        -- 아이디 중복 조회
        SELECT COUNT(*)
        FROM USER_INFO
        WHERE USER_ID = 'admin'
        ;
        
        
        