

.datatable.aware=TRUE

# reticulate::source_python("get_api.py")
# # Translate to data.tables ------------------------------------------------
# all_history_df <- as.data.table( all_history_df)
# elements_df <- as.data.table( elements_df)
# elements_type_df <- as.data.table( elements_type_df)
# teams_df <- as.data.table( teams_df)
# 
# 
# # remove common columns  --------------------------------------------------
# elements_df[, intersect(names(all_history_df) , names(elements_df)) := NULL  ]      
# 
# 
# # create joined table with all features -----------------------------------
# foo <- all_history_df[elements_df , on = .(element=id)][elements_type_df, on = .(element_type =id)][teams_df, on = .(team=id)]
# foo[, player := paste(first_name, second_name)]
# 
# 
# foo <- foo %>%  dplyr::select_if( ~!is.list(.))
# 
# 
# 
# fwrite(foo , "foo.csv")

foo <- data.table::fread("foo.csv")

