//
// Created by root on 4/15/25.
//
#include <cassert>
#include <vector>
#include "abi/word/_base_word.h"
#ifndef PERFORMANCE_COUNTER_H
#define PERFORMANCE_COUNTER_H
#include <iostream>

namespace upmem_sim::simulator::dpu

{
//后期可以用baseword优化
class PerformanceCounter {
    public:
    explicit PerformanceCounter()
    {
       counter_word = new abi::word::_BaseWord(64);
    }
    ~PerformanceCounter()
    {
        delete counter_word;
    }
    void add_counter(int value,int mode)
    {

        assert(mode==1 || mode==2 || mode==0);
        int mode_t=counter_word->bit_slice(abi::word::UNSIGNED,1,3);
        if (mode_t==mode)
        {
            int sub_counter_=sub_counter+value;
            int mult=sub_counter/16;
            sub_counter=sub_counter%16;
            if (mult>0)
            {
                //std::cout<<"before:"<<counter_word->bit_slice(abi::word::UNSIGNED,4,36)<<" try to add "<<value<<" with mode "<<mode<<std::endl;
                int value_t=counter_word->bit_slice(abi::word::UNSIGNED,4,36)+mult;
                counter_word->set_bit_slice(4,36,value_t);
                //std::cout<<"after:"<<counter_word->bit_slice(abi::word::UNSIGNED,4,36)<<std::endl;
            }
            sub_counter++;
        }
    }
    void set_cfg(int value)
    {
        assert(value<=7 && value>=0);
        //std::cout<<"cfg before:"<<counter_word->bit_slice(abi::word::UNSIGNED,0,3)<<" to set "<<value<<std::endl;
        int flag=counter_word->bit_slice(abi::word::UNSIGNED,0,1);
        counter_word->set_bit_slice(0,3,value);
        //std::cout<<"cfg after:"<<counter_word->bit_slice(abi::word::UNSIGNED,0,3)<<std::endl;
        int flag_t=counter_word->bit_slice(abi::word::UNSIGNED,0,1);
        if (flag==0 && flag_t==1)
        {
            std::cout<<"set zero"<<std::endl;
            counter_word->set_bit_slice(4,36,0);
            counter_word->set_bit_slice(0,1,0);
            sub_counter=0;
        }
    }
    int get_value()
    {
        int value_t=counter_word->bit_slice(abi::word::UNSIGNED,4,36);
        return 0;
    }
    private:
        abi::word::_BaseWord *counter_word;
        int sub_counter=0;
};
}
#endif //PERFORMANCE_COUNTER_H
