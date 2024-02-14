#!/usr/bin/python
class FilterModule(object):
    def filters(self):
        return {
            'resource_output_filter': self.resource_output_filter,
            'resource_overcommit_filter': self.resource_overcommit_filter,
        }

    def resource_output_filter(self, resource_str):
        l = str.split(resource_str)
        resource_dict = {"resource_type": l[0], "requests": l[1]+" "+l[2], "limits": l[3]+" "+l[4]}
        return resource_dict
    
    def resource_overcommit_filter(self, node_resources):
        overcommit_list = []
        for i in node_resources:
            if int(i["limits"].split('(')[1].split('%')[0]) >= 90:
                overcommit_list.append(i["resource_type"])   
        return overcommit_list