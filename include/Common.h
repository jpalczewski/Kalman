#pragma once
#include <boost/log/core.hpp>
#include <boost/log/trivial.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/sinks/text_file_backend.hpp>
#include <boost/log/utility/setup/file.hpp>
#include <boost/log/utility/setup/common_attributes.hpp>
#include <boost/log/sources/severity_logger.hpp>
#include <boost/log/sources/record_ostream.hpp>
#include <boost/shared_ptr.hpp>

#include "Currently.h"
#include "Status.h"
#include "Workable.h"
#include "Worker.h"
#include "SimpleWorkerPool.h"

namespace logging = boost::log;



//! Klasa pozostawiona dla symestrii, zawierająca funkcje ogólnego przeznaczenia.
class Common
{

    public:
        Common();
        ~Common();

        /** Ustawienie filtru dla Boost::log.
            Filtruje wiadomości poprzez makro BOOST_LOG_TRIVIAL.
        \param which minimalna wyświetlana wartość, 0: trace, 6: fatal.
        \returns nic
        */
        static void InitBoostLog(int which);
};
