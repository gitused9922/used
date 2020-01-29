<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

						<ul class="list-group">
							<c:forEach items="${ not empty replies ? replies : board.replies }" var="reply">
							<c:if test="${ reply.rno > 0 }">						
							<li class='list-group-item' data-rno='${ reply.rno }'>
								<div style="margin-left:${ reply.depth * 20 }px">
									<div class='header'>
									<c:if test="${ not reply.delete }">
										<strong class='primary-font'>${ reply.replyer }</strong>
										<small class='float-right'>${ reply.replyDate }</small>
									</c:if>
									</div>
									<p>
									<c:choose>
									<c:when test="${ not reply.delete }">
									${ reply.reply }
									</c:when>
									<c:otherwise>
									[삭제된 댓글입니다]									
									</c:otherwise>
									</c:choose>
									</p>
									<div class="footer">
										<c:if test="${ not reply.delete }">
										<c:if test="${loginuser.memberId == reply.replyer }">
										<button data-rno='${ reply.rno }' class="btn btn-primary btn-sm reply-update">수정</button>
										<button data-rno='${ reply.rno }' class="btn btn-primary btn-sm reply-delete">삭제</button>
										</c:if>
										
										</c:if>
										
									</div>
								</div>
							</li>
							</c:if>
							</c:forEach>
														
						</ul>