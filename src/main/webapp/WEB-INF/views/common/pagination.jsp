<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script id="page_template" type="text/html">
<tr>
	<td colspan="15" align="right">
	<ul class="pagination form-inline">
	  <li><a href="javascript:void(0);">第{{currentPage}}页/共{{pageCount}}页</a></li>
			<li><a href="javascript:void(0);" data-page="1">首页</a></li>
			{{if currentPage==1}}<li class="prev disabled">{{else}}<li class="prev">{{/if}}
	          	{{if currentPage-1>0}}
	            	<a href="javascript:void(0);" data-page="{{currentPage-1 }}">&laquo;</a>
	          	{{else}}
	            	<a href="javascript:void(0);" data-page="{{currentPage}}"> &laquo; </a>
	            {{/if}}
	        </li>
	        {{each pages as item i}}
				{{if item==currentPage}}<li class="active">{{else}}<li class="prev">{{/if}}
				<a href="javascript:void(0);" data-page="{{item}}">{{item}}</a>
				</li>
			{{/each}}
			{{if currentPage==pageCount}}<li class="next disabled">{{else}}<li class="next">{{/if}}
			  	{{if currentPage==pageCount}}	
					<a href="javascript:void(0);" data-page="{{currentPage}}">  &raquo;  </a>
				{{else}}
					<a href="javascript:void(0);" data-page="{{currentPage+1}}">  &raquo;  </a>
				{{/if}}
	        </li>
			<li><a href="javascript:void(0);" data-page="{{pageCount}}">尾页</a></li>
 	        <li>&nbsp;&nbsp;到第<input type="text"
	          class="form-control" value="{{currentPage}}"
	          id="toPageNum" style="width: 55px;height:25px;" />页&nbsp;&nbsp;<input
	          class="btn btn-xs btn-info margin-bottom-empty to-pager" type="button" value="确定" />
			</li>
		</ul>
	</td>
</tr>						
</script>