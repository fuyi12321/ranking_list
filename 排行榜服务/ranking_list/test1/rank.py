import functools
from builtins import dict


class RanklistBase(dict):
    def __init__(self, name, redis_handler, ex=30):
        self.name = name
        self.redis_handler = redis_handler
        self.ex = ex
        self.ranklist = []
        self.plugin_functions = []

    # 将数据push_in到排行榜中
    def push_in(self, item):
        user_id = str(item.get('user_id'))
        item.update({'user_id': user_id})
        [f(item) for f in self.plugin_functions]
        self[user_id] = item

    # 从大到小排序
    def sort_by(self, key_item):
        sort_list = self.values()
        # 将老式的比较函数转化为关键字函数
        key = sorted(sort_list, key=functools.cmp_to_key(lambda x, y: int(x[key_item]) - int(y[key_item])),
                     reverse=True)
        self.ranklist = key
        return self

    # 添加排名
    def add_rank(self, care='profit', conflict=True):
        j = 1
        new_rank_list = []
        last_record = {}
        for i in self.ranklist:
            rank_index = {}
            if conflict:
                last_v = last_record.get(care)
                rank_index = last_record.get("rank") if int(
                    i.get(care)) == last_v else j
            i.update({
                "rank": str(rank_index)
            })
            j += 1
            new_rank_list.append(i)
            last_record.update({
                care: i.get(care),
                "rank": str(rank_index)
            })
        self.ranklist = new_rank_list
        return self

    # 我的信息
    def about_me(self, user_id):
        return self.get(str(user_id), {})

    # 前几名
    def top(self, care):
        lst = self.ranklist if self.ranklist else self.values()
        return lst[:care]

    # 范围查询
    def range(self, care_left, care_right):
        lst = self.ranklist if self.ranklist else self.values()
        return lst[care_left:care_right]


if __name__ == '__main__':
    pass
