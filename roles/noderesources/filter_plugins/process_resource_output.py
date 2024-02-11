#!/usr/bin/python
class FilterModule(object):
    def filters(self):
        return {
            'resource_output_filter': self.resource_output_filter,
        }

    def resource_output_filter(self, resource_str):
        l = str.split(resource_str)
        resource_dict = {l[0]: {"requests": l[1]+l[2], "limits": l[3]+l[4]}}
        return resource_dict