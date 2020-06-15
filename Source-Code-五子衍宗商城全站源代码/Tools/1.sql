Use my5zyz

DECLARE @UserId varchar(50)
DECLARE @PUserId varchar(50)
DECLARE @AllMoney money
DECLARE My_Cursor CURSOR --定义游标  
FOR (select kyid,AllMoney from ZL_CommonModel left join ZL_C_xsyj on ItemID=ID where ModelID=49 And Status=99 And DateDiff(dd,datas,getdate())=1) --查出需要的集合放到游标中  
OPEN My_Cursor; --打开游标  
FETCH NEXT FROM My_Cursor INTO @UserId,@AllMoney; --读取第一行数据(将MemberAccount表中的UserId放到@UserId变量中) 

WHILE @@FETCH_STATUS = 0  
    BEGIN  
        PRINT @UserId; --打印数据(打印MemberAccount表中的UserId) 
        
			--一级用户处理
			DECLARE My_Cursor1 CURSOR --定义游标  
			FOR (select UserID from ZL_User where UserID=(select ParentUserID from ZL_User where UserID=@UserId)) --查出需要的集合放到游标中  
			OPEN My_Cursor1; --打开游标  
			FETCH NEXT FROM My_Cursor1 INTO @PUserId; --读取第一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
			WHILE @@FETCH_STATUS = 0  
				BEGIN  
					PRINT @PUserId; --打印数据(打印MemberAccount表中的UserId) 
					UPDATE ZL_User SET Purse=(Purse+@AllMoney*0.1) WHERE UserID = @PUserId; --更新数据
			INSERT [ZL_UserExpDomP] ([UserID],[Score],[HisTime],[Operator],[Detail],[OperatorIP]) VALUES (@PUserId,@AllMoney*0.1,GETDATE(),1,N'来自用户:'+@UserId+'('+(select UserName from ZL_User where UserID=@UserId)+')的推广收益',N'::1')
					FETCH NEXT FROM My_Cursor1 INTO @PUserId; --读取下一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
				END  
			CLOSE My_Cursor1; --关闭游标  
			DEALLOCATE My_Cursor1; --释放游标
			
			--二级用户处理
			DECLARE My_Cursor1 CURSOR --定义游标  
			FOR (select UserID from ZL_User where UserID=(select ParentUserID from ZL_User where UserID=(select ParentUserID from ZL_User where UserID=@UserId))) --查出需要的集合放到游标中  
			OPEN My_Cursor1; --打开游标  
			FETCH NEXT FROM My_Cursor1 INTO @PUserId; --读取第一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
			WHILE @@FETCH_STATUS = 0  
				BEGIN  
					PRINT @PUserId; --打印数据(打印MemberAccount表中的UserId) 
					UPDATE ZL_User SET Purse=(Purse+@AllMoney*0.05) WHERE UserID = @PUserId; --更新数据
			INSERT [ZL_UserExpDomP] ([UserID],[Score],[HisTime],[Operator],[Detail],[OperatorIP]) VALUES (@PUserId,@AllMoney*0.05,GETDATE(),1,N'来自用户:'+@UserId+'('+(select UserName from ZL_User where UserID=@UserId)+')的推广收益',N'::1')
					FETCH NEXT FROM My_Cursor1 INTO @PUserId; --读取下一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
				END  
			CLOSE My_Cursor1; --关闭游标  
			DEALLOCATE My_Cursor1; --释放游标

			--三级用户处理
			DECLARE My_Cursor1 CURSOR --定义游标  
			FOR (select UserID from ZL_User where UserID=(select ParentUserID from ZL_User where UserID=(select ParentUserID from ZL_User where UserID=(select ParentUserID from ZL_User where UserID=@UserId)))) --查出需要的集合放到游标中  
			OPEN My_Cursor1; --打开游标  
			FETCH NEXT FROM My_Cursor1 INTO @PUserId; --读取第一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
			WHILE @@FETCH_STATUS = 0  
				BEGIN  
					PRINT @PUserId; --打印数据(打印MemberAccount表中的UserId) 
					UPDATE ZL_User SET Purse=(Purse+@AllMoney*0.03) WHERE UserID = @PUserId; --更新数据
			INSERT [ZL_UserExpDomP] ([UserID],[Score],[HisTime],[Operator],[Detail],[OperatorIP]) VALUES (@PUserId,@AllMoney*0.03,GETDATE(),1,N'来自用户:'+@UserId+'('+(select UserName from ZL_User where UserID=@UserId)+')的推广收益',N'::1')
					FETCH NEXT FROM My_Cursor1 INTO @PUserId; --读取下一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
				END  
			CLOSE My_Cursor1; --关闭游标  
			DEALLOCATE My_Cursor1; --释放游标
        
        FETCH NEXT FROM My_Cursor INTO @UserId,@AllMoney; --读取下一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
    END  
CLOSE My_Cursor; --关闭游标  
DEALLOCATE My_Cursor; --释放游标  
GO