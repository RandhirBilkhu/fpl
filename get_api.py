import requests
import pandas as pd

url = "https://fantasy.premierleague.com/api/bootstrap-static/"
resp = requests.get(url)

json = resp.json()

json.keys()

elements_df = pd.DataFrame(json['elements'])
elements_type_df = pd.DataFrame(json['element_types'])
teams_df = pd.DataFrame(json['teams'])

url = f'https://fantasy.premierleague.com/api/element-summary/1/'

for x in elements_df.index :
    print(x)
    element_id = elements_df.id[x]
    url = f'https://fantasy.premierleague.com/api/element-summary/{element_id}/'
    r = requests.get(url)
    json = r.json()
    json_history_df = pd.DataFrame(json['history'])
    json_history_past_df = pd.DataFrame(json['history_past'])

    if x == 0 :
        all_history_df = json_history_df
        all_history_past_df = json_history_past_df
    else :
        all_history_df = all_history_df.append(json_history_df)
        all_history_past_df = all_history_past_df.append(json_history_past_df)
