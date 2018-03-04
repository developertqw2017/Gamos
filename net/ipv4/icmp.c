struct imcp{
    u_char icmp_type;               /*type of message, see below */
    u_char icmp_code;               /*type sub code*/
    u_short icmp_cksum;             /* ones complement cksum of struct */
    union{
        u_char ih_pptr;             /* ICMP_PARAMPROB */
        struct in_addr ih_gwaddr;   /* ICMP_REDIRECT */
        struct ih_idseq;
    }ih_idseg;
    int ih_void;

    /* ICMP_UNREACH_NEEDFRAG --Path MTU Discovery (RFC1191) */
    struct ih_pmtu{
        n_short ipm_void;
        n_short ipm_nextmtu;
    }ih_pmtu

}icmp_hun;
